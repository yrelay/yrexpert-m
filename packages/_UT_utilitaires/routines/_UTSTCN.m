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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 26/08/12 ! ZN n'existe par pour GTM                       !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%UTSTCN^INT^1^59547,74033^0
%UTSTCN ;;02:53 PM  4 Sep 1996; 03 May 93  8:44 AM ; 15 Oct 93  4:31 PM
 
 
 
 
 
 
 
 
 
 
 
TECHNO N REPT,TECH,%T,RR,%R
 S REPT=$$NOMINT^%QSF("TECHNOLOGIE")
 Q:REPT=""
 S TECH="" F %T=0:0 S TECH=$$NXTRI^%QSTRUC8(REPT,TECH) Q:TECH=""  S RR="" F %R=0:0 S RR=$O(^[QUI]QUERY2(RR)) Q:RR=""  I $D(^[QUI]QUERY2(RR,"AVEC.TECHNOLOGIE."_TECH)) D PKA
 Q
PKA W !,"repertoire ",RR,"  ","AVEC.TECHNOLOGIE."_TECH
 D PKA^%QSGESTI(RR,"AVEC.TECHNOLOGIE."_TECH)
 Q
 
 
 
 
 
 
 
PARASITE(NETTOIE) 
 S PARASITE="^["""_$$PCONF^%INCASTS("PROG")_"""]PARASITE"
 K @(PARASITE) S @PARASITE=0
 ;HL002 ZN QUI
 S ZN=$$ZGBLDIR^%GTM(QUI)
 S g="^A"
;HL002 PA1 S g=$O(@g) I g="" ZN $$PCONF^%INCASTS("PROG") Q
PA1 S g=$O(@g) I g="" S ZN=$$ZGBLDIR^%GTM($$PCONF^%INCASTS("PROG")) Q
 S g="^"_g W !,g
 S ref=g_"("""")"
 ;; cao debug ^%Q	
PA2 S ref=$$^%Q($Q(@ref)) G:ref="" PA1
 W !,ref
 I '($$OKPARA(ref)) D ERREUR1 G PA2
 
 G PA2
 Q
ERREUR1 
 W !,ref
 S @PARASITE=@PARASITE+1
 S @PARASITE@(@PARASITE,"REF")=ref
 S @PARASITE@(@PARASITE,"VAL")="<inaccessible>"
 S OKACC=0
 S $ZT="G ERRGETV^%UTSTCN"
 S @PARASITE@(@PARASITE,"VAL")=@ref,OKACC=1
ERRGETV S $ZT=""
 S @PARASITE@(@PARASITE,"NET")=0 D:NETTOIE NETTOIE
 Q
OKPARA(VAL) 
 F I=1:1 S CAR=$E(VAL,I) Q:CAR=""  S ASC=$A(CAR) I (ASC<32)!(ASC>126) G NOK
 Q 1
NOK Q 0
 
NETTOIE 
 N nval,nref
 S nval=$S(OKACC:$$NET^%QZCHNET(@ref),1:"")
 S nref=$$NET^%QZCHNET(ref)
 S $ZT="G PBMENET^%UTSTCN"
 S @(nref_"=nval")
 S $ZT=""
 S @PARASITE@(@PARASITE,"NET")=1
 K @(ref)
 Q
PBMENET S $ZT=""
 Q
 
 
 
VERIF 
 S PARASITE="^["""_$$PCONF^%INCASTS("PROG")_"""]PARASITE"
 K @(PARASITE)
 ;HL002 ZN QUI
 S ZN=$$ZGBLDIR^%GTM(QUI)
 S G="^A" F %G=0:0 S G=$O(@G) Q:G=""  S G="^"_G W !,G D VERICLE
 ;HL002 ZN $$PCONF^%INCASTS("PROG")
 S ZN=$$ZGBLDIR^%GTM($$PCONF^%INCASTS("PROG"))
 Q
VERICLE 
 S (N1,N2,N3,N4,N5,N6)=0
 S A1=""
A1 S A1=$O(@G@(A1)) Q:A1=""
 S N1='($$OK(A1,.NA1))
 I N1,$D(@G@(A1))#10 S @PARASITE@(G,A1)=@G@(A1)
 I $D(@G@(A1))>9 S A2="" G A2
 G A1
A2 S A2=$O(@G@(A1,A2)) G:A2="" A1
 S N2='($$OK(A2,.NA2))
 I N1!N2,$D(@G@(A1,A2))#10 S @PARASITE@(G,A1,A2)=@G@(A1,A2)
 I $D(@G@(A1,A2))>9 S A3="" G A3
 G A2
A3 S A3=$O(@G@(A1,A2,A3)) G:A3="" A2
 S N3='($$OK(A3,.NA3))
 I (N1!N2)!N3,$D(@G@(A1,A2,A3))#10 S @PARASITE@(G,A1,A2,A3)=@G@(A1,A2,A3)
 I $D(@G@(A1,A2,A3))>9 S A4="" G A4
 G A3
A4 S A4=$O(@G@(A1,A2,A3,A4)) G:A4="" A3
 S N4='($$OK(A4,.NA4))
 I ((N1!N2)!N3)!N4,$D(@G@(A1,A2,A3,A4))#10 S @PARASITE@(G,A1,A2,A3,A4)=@G@(A1,A2,A3,A4)
 I $D(@G@(A1,A2,A3,A4))>9 S A5="" G A5
 G A4
A5 S A5=$O(@G@(A1,A2,A3,A4,A5)) G:A5="" A4
 S N5='($$OK(A5,.NA5))
 I (((N1!N2)!N3)!N4)!N5,$D(@G@(A1,A2,A3,A4,A5))#10 S @PARASITE@(G,A1,A2,A3,A4,A5)=@G@(A1,A2,A3,A4,A5)
 I $D(@G@(A1,A2,A3,A4,A5))>9 S A6="" G A6
 G A5
A6 S A6=$O(@G@(A1,A2,A3,A4,A5,A6)) G:A6="" A5
 S N6='($$OK(A6,.NA6))
 I ((((N1!N2)!N3)!N4)!N5)!N6,$D(@G@(A1,A2,A3,A4,A5,A6))#10 S @PARASITE@(G,A1,A2,A3,A4,A5,A6)=@G@(A1,A2,A3,A4,A5,A6)
 G A6
 
OK(VAL,GOOD) 
 N OK
 S GOOD=$$NET^%QZCHNET(VAL),OK=VAL=GOOD
 I '(OK) W *7,!,VAL
 Q OK
 
 
 
 
 
 
 
 
 
REPARE 
 S G="^PARASITE"
 S GLO=""
GLO S GLO=$O(@G@(GLO)) Q:GLO=""
 S GLA="^[QUI]"_$E(GLO,2,$L(GLO)),B1=""
B1 S B1=$O(@G@(GLO,B1)) G:B1="" GLO
 S X=$$OK(B1,.NB1) K:'(X) @GLA@(B1) G:NB1="" B1
 I $D(@G@(GLO,B1))#10 S @GLA@(NB1)=@G@(GLO,B1)
 I $D(@G@(GLO,B1))>9 S B2="" G B2
 G B1
B2 S B2=$O(@G@(GLO,B1,B2)) G:B2="" B1
 S X=$$OK(B2,.NB2) K:'(X) @GLA@(B1,B2) G:NB2="" B2
 I $D(@G@(GLO,B1,B2))#10 S @GLA@(NB1,NB1,NB2)=@G@(GLO,B1,B2)
 I $D(@G@(GLO,B1,B2))>9 S B3="" G B3
 G B2
B3 S B3=$O(@G@(GLO,B1,B2,B3)) G:B3="" B2
 S X=$$OK(B3,.NB3) K:'(X) @GLA@(B1,B2,B3) G:NB3="" B3
 I $D(@G@(GLO,B1,B2,B3))#10 S @GLA@(NB1,NB1,NB2,NB3)=@G@(GLO,B1,B2,B3)
 I $D(@G@(GLO,B1,B2,B3))>9 S B4="" G B4
 G B3
B4 S B4=$O(@G@(GLO,B1,B2,B3,B4)) G:B4="" B3
 S X=$$OK(B4,.NB4) K:'(X) @GLA@(B1,B2,B3,B4) G:NB4="" B4
 I $D(@G@(GLO,B1,B2,B3,B4))#10 S @GLA@(NB1,NB1,NB2,NB3,NB4)=@G@(GLO,B1,B2,B3,B4)
 I $D(@G@(GLO,B1,B2,B3,B4))>9 S B5="" G B5
 G B4
B5 S B5=$O(@G@(GLO,B1,B2,B3,B4,B5)) G:B5="" B4
 S X=$$OK(B5,.NB5) K:'(X) @GLA@(B1,B2,B3,B4,B5) G:NB5="" B5
 I $D(@G@(GLO,B1,B2,B3,B4,B5))#10 S @GLA@(NB1,NB1,NB2,NB3,NB4,NB5)=@G@(GLO,B1,B2,B3,B4,B5)
 I $D(@G@(GLO,B1,B2,B3,B4,B5))>9 S B6="" G B6
 G B5
B6 S B6=$O(@G@(GLO,B1,B2,B3,B4,B5,B6)) G:B6="" B5
 S X=$$OK(B6,.NB6)
 K:'(X) @GLA@(B1,B2,B3,B4,B5,B6)
 G:NB6="" B6
 I $D(@G@(GLO,B1,B2,B3,B4,B5,B6))#10 S @GLA@(NB1,NB1,NB2,NB3,NB4,NB5,NB6)=@G@(GLO,B1,B2,B3,B4,B5,B6)
 G B6
 ;

