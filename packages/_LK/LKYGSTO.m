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

;LKYGSTO^INT^1^59547,74868^0
LKYGSTO(GLO,DATA) 
 
 
 
 
 
 N ATT,BASE,BLKI,CH,CPT,DAT,IND,LIEN,LONG,NUM,OR,POS,ROOT,SEP,VA,LDAT,TEMPIO
 S LDAT=$$DATE^%QMDATE_" "_$$HEURE^%QMDATE
 S ROOT="^[QUI]LK(""TOLAS"",""D"")"
 S TEMPIO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"A.MARQUER")
 K @(TEMPIO)
 S DAT=$$CONCAS^%QZCHAD(DATA,"REP")
 S DAT=$$CONCAS^%QZCHAD(DAT,"D")
 S SEP=@DATA@("S")
 S CPT="",BLKI=$ZP(@ROOT@(""))
PARC 
 S CPT=$O(@GLO@(CPT))
 G:CPT="" STOF
 S BLKI=BLKI+1
 S NUM=""
ATR 
 S NUM=$O(@DAT@(NUM)) G:NUM="" PARC
 S POS="",CH=""
POS 
 S POS=$O(@DAT@(NUM,POS))
 I POS="" S @ROOT@(BLKI,NUM)=$E(CH,1,@DATA@("E",NUM,"LONGUEUR")) G ATR
 D VAL
 S CH=CH_VA_SEP
 G POS
 
STOF 
 S BASE=""
STOFB1 S BASE=$O(@TEMPIO@(BASE))
 I BASE="" K @(TEMPIO) Q
 S IND=""
STOFB2 S IND=$O(@TEMPIO@(BASE,IND))
 G:IND="" STOFB1
 D PA^%QSGESTI(BASE,IND,"PASSERELLE.SORTIE",1,LDAT)
 G STOFB2
 
VAL 
 S IND=""
 I '($D(@DAT@(NUM,POS,"ATT"))) S VA="" G FV
 S ATT=@DAT@(NUM,POS,"ATT")
 I ATT="CONSTANTE" G DEF
 
 S OR=@DAT@(NUM,POS,"O")
 S LIEN=@DAT@(NUM,POS,"L")
 S IND=$O(@GLO@(CPT,LIEN,""))
 I IND="" S VA="" G VD
 S BASE=@GLO@(CPT,LIEN,IND)
 I $D(@DAT@(NUM,POS,"D",BASE,IND,ATT)) S VA=@DAT@(NUM,POS,"D",BASE,IND,ATT) G FV
 I $E(OR)="@" S OR=$$^%QSCALIN(BASE,IND,$E(OR,2,$L(OR)),1)
 S VA=$$^%QSCALIN(BASE,IND,ATT,OR)
 
VD I VA="" S VA=@DAT@(NUM,POS,"V")
 I VA="" G FV
 
 I @DAT@(NUM,POS,"N")'=0 S VA=$$NUME(VA,@DAT@(NUM,POS,"N"),@DAT@(NUM,POS,"NC")) G FV
 
 I @DAT@(NUM,POS,"F")'="" S VA=$$^%QMDAFFI(VA,@DAT@(NUM,POS,"F")) G FV
 G FV
DEF 
 S VA=@DAT@(NUM,POS,"V")
 
FV S LONG=@DAT@(NUM,POS,"T")-$L(SEP)
 I VA="" S VA=$J(" ",LONG) G FVI
 S VA=$$S^%QAX(VA)
 I @DAT@(NUM,POS,"N")=0 S VA=$$FORMAT(VA,LONG)
 E  S VA=$$FORME(VA,LONG,@DAT@(NUM,POS,"NC"))
FVI I IND'="" S @DAT@(NUM,POS,"D",BASE,IND,ATT)=VA,@TEMPIO@(BASE,IND)=""
 Q
 
NUME(V,LN,C) 
 
 N V1,V2
 S V1=$P(V,".",1),V2=$P(V,".",2)
 S V1=$E(V1,1,LN) I (LN-$L(V1))>0 S V1=$TR($J("",LN-$L(V1))," ",C)_V1
 S V1=V1_$S(V2="":"",1:"."_V2)
 Q V1
 
FORME(S,SI,C) 
 
 
 I S'["." S S=S_"."
 I SI=$L(S) Q S
 I (SI-$L(S))<0 Q $E(S,1,SI)
 Q $E(S,1,SI)_$TR($J("",SI-$L(S))," ",C)
 
FORMAT(S,SI) 
 
 Q $E(S,1,SI)_$J("",SI-$L(S))

