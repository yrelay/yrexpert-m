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

;%QWSELEC^INT^1^59547,73886^0
%QWSELEC(RSEL) ;;02:45 PM  4 Sep 1996
 
 
 
 
 
 
 
 
 
 N GLOIND,BACT,DACT,IACT,TACT,RACT,CHOIX,%ISTP
 
 
 
 
 S @WWSEL@(ISTP)=""
 I ISTP=0 S GLOIND=WWSTOCK G FSNDB
 S GLOIND=$$CONCAT^%QZCHAD($$CONCAT^%QZCHAD(WWSTEP,ISTP-1),"""P""")
 D COPIER($$CONCAT^%QZCHAD(WWSEL,ISTP-1),$$CONCAT^%QZCHAD(WWSEL,ISTP))
 S CHOIX=@WWSTEP@(ISTP-1,"CHOIX")
 S %I=1 F I="BACT","IACT","TACT","DACT","RACT" S @(I_"=$P(CHOIX,"_""""_"^"_""""_",%I)"),%I=%I+1
 I TACT=1,^[QUI]RQSDON("QW","C1",DACT,RACT,"S") K @WWSEL@(ISTP,BACT,IACT,TACT,DACT,RACT)
 
FSNDB 
 D AJDELTA(GLOIND,$$CONCAT^%QZCHAD(WWSEL,ISTP))
 
 
 S %ISTP=0
BOUCL G:%ISTP'<ISTP FBOUCL
 S CHOIX=@WWSTEP@(%ISTP,"CHOIX")
 S %I=1 F I="BACT","IACT","TACT","DACT","RACT" S @(I_"=$P(CHOIX,"_""""_"^"_""""_",%I)"),%I=%I+1
 I '($$REAPPLI(TACT,RACT,DACT)) K @WWSEL@(ISTP,BACT,IACT,TACT,DACT,RACT)
 S %ISTP=%ISTP+1
 G BOUCL
 
FBOUCL 
 D MKRESUL($$CONCAT^%QZCHAD(WWSEL,ISTP),RSEL)
 Q
 
 
 
 
 
 
AJDELTA(GLOIND,WSEL) 
 N REP,IND,BIDON,DJVU,RSELRI,DOM,PILE,TEMP,GROUVU
 N PERCOUR,LEVEL,DOMCOUR,GREL,PILP,OKHIER,DCOUR,%D,%IRG
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"AJ") K @(TEMP)
 S GROUVU=$$CONCAS^%QZCHAD(TEMP,"GR")
 S GREL="^[QUI]RQSDON(""QW"",""CD"")"
 S BIDON=""
 S REP=""
S2REP S REP=$O(@GLOIND@(REP)) I REP="" K @(TEMP) Q
 S IND=""
S2IND S IND=$O(@GLOIND@(REP,IND)) G:IND="" S2REP
 K @(GROUVU)
 F %IRG=1:1:4 S DJVU(%IRG)="BIDON" I $D(@WSEL@(REP,IND,%IRG)) S DJVU(%IRG)=$$CONCAS^%QZCHAD(WSEL,REP_","_IND_","_%IRG)
 S RSELRI=$$CONCAS^%QZCHAD(WSEL,REP_","_IND)
 
 
 
 S DCOUR=DOMEX F %D=0:-1 Q:DCOUR="GENERAL"  S DCOUR=@GREL@(DCOUR,"PERE"),PILP(%D)=DCOUR
 S OKHIER=1
 I $D(PILP) S %DI="" F %D=0:0 S %DI=$O(PILP(%DI)) Q:%DI=""  S DCOUR=PILP(%DI) I '($$TRTDOM(DCOUR)) S OKHIER=0 Q
 G:OKHIER=0 S2IND
 
 S DOMCOUR=DOMEX,LEVEL=1
CONS 
 
 I '($$TRTDOM(DOMCOUR)) G CONS05
 I $D(@GREL@(DOMCOUR,"FILS")) G CONS11
CONS05 S LEVEL=LEVEL-1 G:LEVEL<1 S2IND
 S PERCOUR=PILE(LEVEL)
 S DOMCOUR=$O(@GREL@(PERCOUR,"FILS",DOMCOUR))
 I DOMCOUR="" S DOMCOUR=PERCOUR G CONS05
 G CONS
CONS11 
 S PILE(LEVEL)=DOMCOUR
 S LEVEL=LEVEL+1
 S DOMCOUR=$O(@GREL@(DOMCOUR,"FILS",""))
 G CONS
 
TRTDOM(DOM) 
 I $$EVAL^%QWDMAC(REP,IND,DOM)<1 Q 0
 D SELEC^%QWSER1(REP,IND,DOM,RSELRI)
 D SELEC^%QWSER2(REP,IND,DOM,RSELRI,DJVU(2))
 D SELEC^%QWSER3(REP,IND,DOM,RSELRI,DJVU(3))
 I '(ESPATT) D SELEC^%QWSER4(REP,IND,DOM,RSELRI,DJVU(4))
 Q 1
 
 
 
 
MKRESUL(GS,GD) 
 N %D,%R,%T,B,D,I,T,R
 S B=""
MKB S B=$O(@GS@(B)) Q:B=""
 S I=""
MKI S I=$O(@GS@(B,I)) G:I="" MKB
 S T="" F %T=0:0 S T=$O(@GS@(B,I,T)) Q:T=""  S D="" F %D=0:0 S D=$O(@GS@(B,I,T,D)) Q:D=""  S R="" F %R=0:0 S R=$O(@GS@(B,I,T,D,R)) Q:R=""  S @GD@(B_"^"_I,^[QUI]RQSDON("QW","REM",T,D,R),T_"^"_D_"^"_R)=""
 G MKI
 
REAPPLI(TYRG,REG,DOM) 
 I TYRG=2 Q 0
 I TYRG=4 Q 0
 I TYRG=1 Q 1
 I '($D(^[QUI]RQSDON("QW","C3",DOM,REG,"S"))) Q 1
 Q 1-^[QUI]RQSDON("QW","C3",DOM,REG,"S")
 
COPIER(S,D) N I,AD,ADD
 ;; cao debug ^%Q
 S AD=$$^%Q($Q(@S@(""))),ADD=$$CONCAT(D,$E(AD,$L(S)+1,$L(AD)-1))
 F I=1:0 Q:AD'[$E(S,1,$L(S)-1)  S @ADD=@AD,AD=$Q(@AD),ADD=$$CONCAT(D,$E(AD,$L(S)+1,$L(AD)-1))
 I ($D(@S)#10)=1 S @D=@S
 Q
CONCAT(R,P) I P="" S P=""""""
 I $E(P)="(" S P=$E(P,2,$L(P))
 I R["(" S R=$E(R,1,$L(R)-1)_"," Q R_P_")"
 S P="("_P Q R_P_")"

