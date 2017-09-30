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

;%TXPETA^INT^1^59547,74032^0
%TXPETA(ETUDE,ARB,NOEUD,PERE,PB,APB,PMAX,TMAX,NEWQMIN,NEWQMAX,CTRT) ;;06:25 PM  1 Jul 1993; 14 Jan 93  3:21 PM ; 02 Jul 93  4:32 PM
 
 
 
 S %VALL=0
 S hyp=2
 D ^%VTIME
 S PB=$$GEN^%QCAPOP("PBX"),@tapb@(PB)=APB,@tmax@(PB)=TMAX
 D loadc(ETUDE,ARB,NOEUD,PERE,ATELIER,NEWQMIN,NEWQMAX)
 
 
 
 
 S VISU=$S('($D(^TXPMODE($J,"VISU"))):0,1:^TXPMODE($J,"VISU"))
 
 I VISU#2 O printer
 N %capa,%t S %capa=$O(@etuatcg@("")) G:%capa="" s2 S CONTRAINTE=%capa
 S etat=@etuatc@("Etat de cette contrainte") I etat'="Active" W !,"contrainte ",CONTRAINTE," non active " G s2
 
 F t=1:1:PMAX S %t=qmh*$S($D(@etuatcg@(%capa,"Periode "_t)):@etuatcg@(%capa,"Periode "_t),1:VLIMI) S:(t=TMAX)&(%t>(CTRT*qmh)) %t=CTRT*qmh I @QMAXP@(t)>%t S @QMAXP@(t)=%t
s2 
 I ($D(^TXPMODE($J))#10)=0 S ^TXPMODE($J)=2
 D DEB^%SGMESU("TXP: resolution TXP1R")
 I ^TXPMODE($J)=1 S %VALL=%VALL+$$V^%TXP1R(PB,APB,ATELIER,ARTICLE,PMAX,demd,stockini,VISU)
 I ^TXPMODE($J)=2 S %VALL=%VALL+$$V^%TXP1RD(PB,APB,ATELIER,ARTICLE,PMAX,demd,stockini,VISU)
 D FIN^%SGMESU("TXP: resolution TXP1R")
 D ^%TXP112R(ETUDE,ARB,NOEUD,PB,APB,ATELIER,ARTICLE,PMAX,demd,32,VISU)
 S @valpb@(PB)=%VALL
 U 0
 Q %VALL
 
loadc(ETUDE,ARB,NOEUD,PERE,ATELIER,NEWQMIN,NEWQMAX) 
 D loadc1(ETUDE,ARB,NOEUD,ATELIER)
 
 F t=1:1:PMAX S @QMINP@(t)=$$PULLMAT^%TXPPRIM(ARBRE,PERE,"QMINP",t,ARTICLE)
 
 I NEWQMIN'="",TYPE=2 S @QMINP@(TMAX)=NEWQMIN
 F t=1:1:PMAX S @QMAXP@(t)=$$PULLMAT^%TXPPRIM(ARBRE,PERE,"QMAXP",t,ARTICLE)
 
 I NEWQMAX'="",TYPE=3 S @QMAXP@(TMAX)=NEWQMAX
 Q
loadc1(ETUDE,ARB,NOEUD,ATELIER) 
 
 S NBC=17 D INIART^%TXPSW2(etuata)
 K @etuata@("Valeur Jauge")
 S:'($D(hyp)) hyp=2
 S cp1=@etuat@("Cout de l'heure de production Normale")
 S cp2=@etuat@("Cout de l'heure de production Exceptionnelle")
 S stp=@etuat@("Cout de lancement")
 S nbhn=$S($D(@etuat@("Nombre d'Heures Normales")):@etuat@("Nombre d'Heures Normales"),1:200)
 
 S cst=@etuata@("cout de stockage(%)")
 S stockini=@etuata@("Stock Initial")
 S qmh=@etuata@("Quantite moyenne horaire"),qmh1=$J(qmh," ",2),qmh=qmh1
 
 S hrp=1
 ;;;;;
 
 D PROD^%TXPARB
 
 N d,d1 S d=$S($D(@dmd@("Periode "_1)):$$GETLBLAN^%VTLBLAN(@dmd@("Periode "_1)),1:0)
 F t=1:1:PMAX S @QMINC@("copie",t)=$$GETLBLAN^%VTLBLAN(@QMINC@(t))*hrp
 
 F t=1:1:PMAX S @QMINP@(t)=@QMINC@("copie",t),d1=$S($D(@dmd@("Periode "_t)):$$GETLBLAN^%VTLBLAN(@dmd@("Periode "_t)),1:d),@demd@(t)=d1,d=d1
 F t=1:1:PMAX S @QMAXC@("copie",t)=$$GETLBLAN^%VTLBLAN(@QMAXC@(t))*hrp,@QMAXP@(t)=100000000*hrp
 
 N %capa,%t S %capa=$O(@etuatcg@("")) G:%capa="" S2 S CONTRAINTE=%capa
 S etat=@etuatc@("Etat de cette contrainte") I etat'="Active" W !,"contrainte ",CONTRAINTE," non active " G S2
 F t=1:1:PMAX S %t=qmh*$S($D(@etuatcg@(%capa,"Periode "_t)):@etuatcg@(%capa,"Periode "_t),1:VLIMI) I @QMAXP@(t)>%t S @QMAXP@(t)=%t
S2 D STOCK^%TXPARB
 
 F t=1:1:PMAX S @RMINC@("copie",t)=$$GETLBLAN^%VTLBLAN(@RMINC@(t))*hrp,@RMINP@(t)=@RMINC@("copie",t)
 F t=1:1:PMAX S @RMAXC@("copie",t)=$$GETLBLAN^%VTLBLAN(@RMAXC@(t))*hrp,@RMAXP@(t)=100000000*hrp
 I TYPE'=0 G SS2
 F t=1:1:PMAX D PUSHMAT^%TXPPRIM(ARB,RACINE,"QMINP",t,ARTICLE,@QMINP@(t))
 F t=1:1:PMAX D PUSHMAT^%TXPPRIM(ARB,RACINE,"QMAXP",t,ARTICLE,@QMAXP@(t))
 F t=1:1:PMAX D PUSHMAT^%TXPPRIM(ARB,RACINE,"RMINP",t,ARTICLE,@RMINP@(t))
 
 F t=1:1:PMAX D PUSHMAT^%TXPPRIM(ARB,RACINE,"RMAXP",t,ARTICLE,@RMAXP@(t))
cap 
 S %capa=$O(@etuatcg@("")) G:%capa="" SS2
 F t=1:1:PMAX S %t=$S($D(@etuatcg@(%capa,"Periode "_t)):@etuatcg@(%capa,"Periode "_t),1:VLIMI) D PUSHMAT^%TXPPRIM(ARB,RACINE,"VALEUR.MAXI.DE.CONTRAINTE",t,%capa,%t)
SS2 D DMD^%TXPARB
 Q

