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

;%TXOPTSEP^INT^1^59547,74032^0
%TXOPTSEP(A,S,T) 
SEPAR(A,S,T) 
 N nvn
 S PERE=$$PERE^%QARBCON(A,S)
 I PERE="" S PERE=RACINE
 
 
 
 I $$PULLVAL^%TXOPTPRIM(A,S,"IRREALISABLE",1)="OUI" Q
 
 
 D ^%TXOPTCTR(A,S)
 
 I $$PULLVAL^%TXOPTPRIM(A,S,"OPTIMUM",1)="OUI" S @etu@("OPTIMUM")=S Q
 
 
 I $$PULLVAL^%TXOPTPRIM(A,S,"IRREALISABLE",1)="OUI" Q
 
 S %PERARB=$$PULLVAL^%TXOPTPRIM(A,S,"PERIODE.A.ARBITRER",1),%ARTARB=$$PULLVAL^%TXOPTPRIM(A,S,"ARTICLE.A.ARBITRER",1),%QUANTITE=$$PULLVAL^%TXOPTPRIM(A,S,"QUANTITE.A.ARBITRER",1),ARTICLE=%ARTARB
 D loadc^%TXOPTETA(ETUDE,A,S,PERE,ATELIER,"","")
 
 
 S T1=$$CONCAS^%QZCHAD(T,"STO"),T2=$$CONCAS^%QZCHAD(T1,"ELEM")
 S F1=$$GEN^%QCAPOP("NXP"),VIF1=1
 S T3=$$CONCAS^%QZCHAD(T1,F1)
 
 
 S VALPERE=$$PULLVAL^%TXOPTPRIM(A,S,"VALEUR",1)
 S NOVALIB=$$PULLVAL^%TXOPTPRIM(A,S,"NOMBRE.DE.VARIABLES.LIBRES",%PERARB)
 S VALF1=VALPERE I NOVALIB=1 S VALF1=30000000,VIF1=0
 
 
 I '(VIF1) G AUTRESSOM
 S @T2@(F1)="" D PUSHVAL^%TXOPTPRIM(T1,F1,"TYPE",1,1)
 D PUSHLIST^%TXOPTPRIM(T1,F1,"VARIABLES.FIXEES",%PERARB_"|"_%ARTARB)
 D PUSHVAL^%TXOPTPRIM(T1,F1,"NOMBRE.DE.VARIABLES.LIBRES",%PERARB,NOVALIB-1)
 D PUSHVAL^%TXOPTPRIM(T1,F1,"VALEUR",1,VALF1)
 
 
AUTRESSOM 
 F %iex=2:1:3 D nvn
 Q
nvn 
 
 
 S @("F"_%iex)=$$GEN^%QCAPOP("NXP")
 
 
 G @%iex
2 
 S %QMIN=(%QUANTITE\qlot)+1,%QMIN=%QMIN*qlot
 
 S %QMAXPERE=@QMAXC@("copie",%PERARB) I %QMAXPERE<@QMAXP@(%PERARB) S %QMAXPERE=@QMAXP@(%PERARB)
 I %QMIN>%QMAXPERE G FINEVA
 S NEWQMIN=%QMIN,NEWQMAX=""
 S NOVALIB=$$PULLVAL^%TXOPTPRIM(A,S,"NOMBRE.DE.VARIABLES.LIBRES",%PERARB) I NOVALIB'>1 G FINEVA
 
 G CORPS
3 
 
 S %QMAX=(%QUANTITE\qlot)-1,%QMAX=%QMAX*qlot
 
 S %QMINPERE=@QMINC@("copie",%PERARB) I %QMINPERE>@QMINP@(%PERARB) S %QMINPERE=@QMINP@(%PERARB)
 I %QMAX<%QMINPERE G FINEVA
 S NEWQMIN="",NEWQMAX=%QMAX
 G CORPS
CORPS 
 S T3=$$CONCAS^%QZCHAD(T1,@("F"_%iex))
 S @T@("STO","ELEM",@("F"_%iex))="",@T3@("STO","TYPE",@("F"_%iex))=%iex
 D PUSHVAL^%TXOPTPRIM(T1,@("F"_%iex),"TYPE",1,%iex)
 
 
 
 D PUSHVAL^%TXOPTPRIM(T1,@("F"_%iex),"PERARB",1,%PERARB)
 
 D PUSHVAL^%TXOPTPRIM(T1,@("F"_%iex),"ARTARB",1,%ARTARB)
 
 S APB=$$PULLVAL^%TXOPTPRIM(A,S,"NOM.PB",ARTICLE)
 S VALPBA=@valpb@(APB)
 S PMAX=@etu@("Nombre de Periodes")
 
 S TYPE=$$PULLVAL^%TXOPTPRIM(T1,@("F"_%iex),"TYPE",1)
 D ARTICLE^%TXOPTARB(ETUDE,T1,@("F"_%iex),PERE,.PB,.APB,PMAX,%PERARB,NEWQMIN,NEWQMAX)
 
 
 S VALPBFILS=@valpb@(PB)
 I VALPBFILS<3000000 G SUITE
 D PUSHVAL^%TXOPTPRIM(T1,@("F"_%iex),"VALEUR",1,3000000)
 D PUSHVAL^%TXOPTPRIM(T1,@("F"_%iex),"IRREALISABLE",1,"OUI")
 G FINEVAL
SUITE 
 
 
 
 D PUSHVAL^%TXOPTPRIM(T1,@("F"_%iex),"NOM.PB",ARTICLE,PB)
 D PUSHVAL^%TXOPTPRIM(T1,@("F"_%iex),"APB",ARTICLE,APB)
 
 
 
 
 
 S VALPERE=$$PULLVAL^%TXOPTPRIM(A,S,"VALEUR",1)
 S @T3@("valeur")=(VALPERE-VALPBA)+@valpb@(PB)
 D PUSHVAL^%TXOPTPRIM(T1,@("F"_%iex),"VALEUR",1,(VALPERE-VALPBA)+@valpb@(PB))
 
 
 I %iex=2 D PUSHMAT^%TXOPTPRIM(T1,@("F"_%iex),"QMINP",%PERARB,ARTICLE,NEWQMIN)
 I %iex=3 D PUSHMAT^%TXOPTPRIM(T1,@("F"_%iex),"QMAXP",%PERARB,ARTICLE,NEWQMAX)
FINEVA Q
FINEVAL Q

