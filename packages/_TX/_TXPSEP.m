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

;%TXPSEP^INT^1^59547,74033^0
%TXPSEP(A,S,T) ;;05:28 PM  25 Mar 1993; ; 11 Mar 93 11:59 AM
SEPAR(A,S,T) 
 N nvn,ISPAPA
 S PERE=$$PERE^%QARBCON(A,S)
 I PERE="" S PERE=RACINE
 I VISU=8 D ELEM^%QULELV(STRAFFI,S,PERE)
 
 
 
 I $$PULLVAL^%TXPPRIM(A,S,"IRREALISABLE",1)="OUI" Q
 
 
 
 
 S TMAX=$$PULLVAL^%TXPPRIM(A,S,"PERARB",1)
 I $$PULLVAL^%TXPPRIM(A,S,"NOMBRE.DE.VARIABLES.LIBRES",TMAX)'>0 D PUSHVAL^%TXPPRIM(A,S,"IRREALISABLE",1,"OUI") Q
 D ^%TXPCTR(A,S)
 
 
 I $$PULLVAL^%TXPPRIM(A,S,"OPTIMUM",1)="OUI" S @etuat@("OPTIMUM")=S Q
 
 
 I $$PULLVAL^%TXPPRIM(A,S,"IRREALISABLE",1)="OUI" Q
 
 S %PERARB=$$PULLVAL^%TXPPRIM(A,S,"PERIODE.A.ARBITRER",1),%ARTARB=$$PULLVAL^%TXPPRIM(A,S,"ARTICLE.A.ARBITRER",1),%QUANTITE=$$PULLVAL^%TXPPRIM(A,S,"QUANTITE.A.ARBITRER",1),ARTICLE=%ARTARB
 
 D loadc^%TXPETA(ETUDE,A,S,PERE,ATELIER,"","")
 
 S ISPAPA=0
 
 
 
 S T1=$$CONCAS^%QZCHAD(T,"STO"),T2=$$CONCAS^%QZCHAD(T1,"ELEM")
 
 S F1=$$GEN^%QCAPOP("NXP"),VIF1=1
 S T3=$$CONCAS^%QZCHAD(T1,F1)
 
 
 S VALPERE=$$PULLVAL^%TXPPRIM(A,S,"VALEUR",1)
 S NOVALIB=$$PULLVAL^%TXPPRIM(A,S,"NOMBRE.DE.VARIABLES.LIBRES",%PERARB)
 S VALF1=VALPERE
 D PUSHVAL^%TXPPRIM(T1,F1,"VALEUR",1,VALF1)
 
 D PUSHVAL^%TXPPRIM(T1,F1,"TYPE",1,1)
 I ($$vercap(A,S,%PERARB,%QUANTITE,T1,F1)="NOK")!(NOVALIB<1) S VALF1=VLIMI D PUSHVAL^%TXPPRIM(T1,F1,"IRREALISABLE",1,"OUI"),PUSHVAL^%TXPPRIM(T1,F1,"VALEUR",1,VALF1) G AUTRESSOM
 
 
 S @T2@(F1)="",ISPAPA=1
 D PUSHLIST^%TXPPRIM(T1,F1,"VARIABLES.FIXEES",%PERARB_"|"_%ARTARB)
 D PUSHVAL^%TXPPRIM(T1,F1,"NOMBRE.DE.VARIABLES.LIBRES",%PERARB,NOVALIB-1)
 D PUSHMAT^%TXPPRIM(T1,F1,"QMINP",%PERARB,ARTICLE,%QUANTITE)
 D PUSHMAT^%TXPPRIM(T1,F1,"QMAXP",%PERARB,ARTICLE,%QUANTITE)
 D PUSHVAL^%TXPPRIM(T1,F1,"IRREALISABLE",1,"NON")
 
 
AUTRESSOM 
 F %iex=2:1:3 D nvn
 
 I '(ISPAPA) D PUSHVAL^%TXPPRIM(A,S,"IRREALISABLE",1,"OUI"),PUSHVAL^%TXPPRIM(A,S,"VALEUR",1,VLIMI+$$PULLVAL^%TXPPRIM(A,S,"VALEUR",1))
 Q
nvn 
 
 
 S @("F"_%iex)=$$GEN^%QCAPOP("NXP")
 
 
 G @%iex
2 
 S %QMIN=(%QUANTITE\qlot)+1,%QMIN=%QMIN*qlot
 
 S %QMAXPERE=@QMAXC@("copie",%PERARB) I %QMAXPERE<@QMAXP@(%PERARB) S %QMAXPERE=@QMAXP@(%PERARB)
 I %QMIN>%QMAXPERE D PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"IRREALISABLE",1,"OUI"),PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"VALEUR",1,VLIMI) G FINEVA
 S NEWQMIN=%QMIN,NEWQMAX=""
 S NOVALIB=$$PULLVAL^%TXPPRIM(A,S,"NOMBRE.DE.VARIABLES.LIBRES",%PERARB) I NOVALIB<1 D PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"IRREALISABLE",1,"OUI"),PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"VALEUR",1,VLIMI) G FINEVA
 I $$vercap(A,S,%PERARB,%QMIN,T1,@("F"_%iex))="NOK" S VALF1=VLIMI D PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"IRREALISABLE",1,"OUI"),PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"VALEUR",1,VALF1) G FINEVA
 
 G CORPS
3 
 S %QMAX=(%QUANTITE\qlot)-1,%QMAX=%QMAX*qlot
 
 S %QMINPERE=@QMINC@("copie",%PERARB) I %QMINPERE>@QMINP@(%PERARB) S %QMINPERE=@QMINP@(%PERARB)
 I %QMAX<%QMINPERE D PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"IRREALISABLE",1,"OUI"),PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"VALEUR",1,VLIMI) G FINEVA
 S NEWQMIN="",NEWQMAX=%QMAX
 S NOVALIB=$$PULLVAL^%TXPPRIM(A,S,"NOMBRE.DE.VARIABLES.LIBRES",%PERARB) I NOVALIB<1 D PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"IRREALISABLE",1,"OUI"),PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"VALEUR",1,VLIMI) G FINEVA
 
 G CORPS
CORPS 
 S T3=$$CONCAS^%QZCHAD(T1,@("F"_%iex))
 S @T2@(@("F"_%iex))="",ISPAPA=1,@T1@("TYPE",@("F"_%iex))=%iex
 D PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"TYPE",1,%iex)
 
 
 D PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"PERARB",1,%PERARB)
 
 D PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"ARTARB",1,%ARTARB)
 
 S APB=$$PULLVAL^%TXPPRIM(A,S,"NOM.PB",ARTICLE)
 S VALPBA=@valpb@(APB)
 S PMAX=$$^%TXPMAX(ATELIER)
 
 S TYPE=$$PULLVAL^%TXPPRIM(T1,@("F"_%iex),"TYPE",1)
 
 S %capa=$O(@etuatcg@("")) I %capa="" S CTRT=VLIMI G SCORPS
 S CTRT=$$PULLMAT^%TXPPRIM(A,S,"VALEUR.MAXI.DE.CONTRAINTE",%PERARB,%capa)
SCORPS 
 D ARTICLE^%TXPARB(ETUDE,T1,@("F"_%iex),S,.PB,.APB,PMAX,%PERARB,NEWQMIN,NEWQMAX,CTRT)
 
 
 
 S VALPBFILS=@valpb@(PB)
 I VALPBFILS<VLIMI G SUITE
 D PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"VALEUR",1,VLIMI)
 D PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"IRREALISABLE",1,"OUI")
 G FINEVAL
SUITE 
 
 I @QMINP@(%PERARB)'=@QMAXP@(%PERARB) G S2
 
 I $$vercap(A,S,%PERARB,@QMAXP@(%PERARB),T1,@("F"_%iex))="NOK" D PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"VALEUR",1,VLIMI),PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"IRREALISABLE",1,"OUI") G S2
 D PUSHLIST^%TXPPRIM(T1,@("F"_%iex),"VARIABLES.FIXEES",%PERARB_"|"_%ARTARB),PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"NOMBRE.DE.VARIABLES.LIBRES",%PERARB,NOVALIB-1)
 
S2 
 D PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"NOM.PB",ARTICLE,PB)
 D PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"APB",ARTICLE,APB)
 D PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"IRREALISABLE",1,"NON")
 
 
 
 
 
 S VALPERE=$$PULLVAL^%TXPPRIM(A,S,"VALEUR",1)
 S @T3@("valeur")=(VALPERE-VALPBA)+@valpb@(PB)
 D PUSHVAL^%TXPPRIM(T1,@("F"_%iex),"VALEUR",1,(VALPERE-VALPBA)+@valpb@(PB))
 
 
 I %iex=2 D PUSHMAT^%TXPPRIM(T1,@("F"_%iex),"QMINP",%PERARB,ARTICLE,NEWQMIN)
 I %iex=3 D PUSHMAT^%TXPPRIM(T1,@("F"_%iex),"QMAXP",%PERARB,ARTICLE,NEWQMAX)
FINEVA Q
FINEVAL Q
 
vercap(A,S,t,%QUANTITE,T1,F1) 
 S qmh=@etuata@("Quantite moyenne horaire"),qmh1=$J(qmh," ",2)
 S qmh=qmh1
 N %capa,%t,%V S %capa=$O(@etuatcg@("")) Q:%capa="" "OK"
 
 S %t=@etuatcg@(%capa,"Periode "_t),%V=$$PULLMAT^%TXPPRIM(A,S,"VALEUR.MAXI.DE.CONTRAINTE",t,%capa),%V=%V-(%QUANTITE/qmh) D PUSHMAT^%TXPPRIM(T1,F1,"VALEUR.MAXI.DE.CONTRAINTE",t,%capa,%V)
 I %V<0 Q "NOK"
 Q "OK"
 ;

