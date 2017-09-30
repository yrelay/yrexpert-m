;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%TXOPTETA^INT^1^59547,74031^0
%TXOPTETA(ETUDE,ARB,NOEUD,PERE,PB,APB,PMAX,TMAX,NEWQMIN,NEWQMAX) ;;08:01 AM  18 Jun 1992; 16 Jun 92  6:22 PM
 
 
 S %VALL=0
 S hyp=2
 D ^VTIME
 S PB=$$GEN^%QCAPOP("PBX"),@tapb@(PB)=APB,@tmax@(PB)=TMAX
 D loadc(ETUDE,ARB,NOEUD,PERE,ATELIER,NEWQMIN,NEWQMAX)
 
 S %VALL=%VALL+$$V^%TXOPT1R(PB,APB,ATELIER,ARTICLE,PMAX,demd,stockini,0) D ^%TXOPT112R(ETUDE,ARB,NOEUD,PB,APB,ATELIER,ARTICLE,PMAX,demd)
 S @valpb@(PB)=%VALL Q %VALL
loadc(ETUDE,ARB,NOEUD,PERE,ATELIER,NEWQMIN,NEWQMAX) 
 S NBC=17 D INIV^%TXOPTSW5(NBC,etuata)
 S qmax1=1600
 S qmax2=(1600*7)/5
 S cp1=@etuat@("Cout de l'heure de production Normale")
 S cp2=@etuat@("Cout de l'heure de production Exceptionnelle")
 S stp=@etuata@("cout de lancement")
 S cst=@etuata@("cout de stockage(%)")
 S stockini=@etuata@("Stock Initial")
 S qmh=@etuata@("Quantite moyenne horaire")
 
 F t=1:1:PMAX S @QMINP@(t)=$$PULLMAT^%TXOPTPRIM(ARBRE,PERE,"QMINP",t,ARTICLE)
 I NEWQMIN'="",TYPE=2 S @QMINP@(TMAX)=NEWQMIN
 F t=1:1:PMAX S @QMAXP@(t)=$$PULLMAT^%TXOPTPRIM(ARBRE,PERE,"QMAXP",t,ARTICLE)
 I NEWQMAX'="",TYPE=3 S @QMAXP@(TMAX)=NEWQMAX
 Q
loadc1(ETUDE,ARB,NOEUD,ATELIER) 
 
 S:'($D(hyp)) hyp=2
 S qmax1=1600
 S qmax2=(1600*7)/5
 S cp1=@etuat@("Cout de l'heure de production Normale")
 S cp2=@etuat@("Cout de l'heure de production Exceptionnelle")
 S stp=@etuat@("Cout de lancement")
 S cst=@etuata@("cout de stockage(%)")
 S stockini=@etuata@("Stock Initial")
 S qmh=@etuata@("Quantite moyenne horaire"),qmh1=qmh\1 I (qmh-qmh1)>4E-1 S qmh1=qmh1+1
 S qmh=qmh1
 F t=1:1:PMAX S @QMINC@("copie",t)=@QMINC@(t)*qmh
 F t=1:1:PMAX S @QMINP@(t)=0,@demd@(t)=@dmd@("Periode "_t)*qmh
 F t=1:1:PMAX S @QMAXC@("copie",t)=@QMAXC@(t)*qmh,@QMAXP@(t)=1600*qmh
 
 F t=1:1:PMAX S @RMINC@("copie",t)=@RMINC@(t)*qmh,@RMINP@(t)=0
 F t=1:1:PMAX S @RMAXC@("copie",t)=@RMAXC@(t)*qmh,@RMAXP@(t)=1600*qmh
 F t=1:1:PMAX D PUSHMAT^%TXOPTPRIM(ARB,RACINE,"QMINP",t,ARTICLE,@QMINP@(t))
 F t=1:1:PMAX D PUSHMAT^%TXOPTPRIM(ARB,RACINE,"QMAXP",t,ARTICLE,@QMAXP@(t))
 F t=1:1:PMAX D PUSHMAT^%TXOPTPRIM(ARB,RACINE,"RMINP",t,ARTICLE,@RMINP@(t))
 F t=1:1:PMAX D PUSHMAT^%TXOPTPRIM(ARB,RACINE,"RMAXP",t,ARTICLE,@QMAXP@(t))
 Q

