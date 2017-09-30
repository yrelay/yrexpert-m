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

;%QEPRIM^INT^1^59547,73875^0
%QEPRIM(NOMLIEN) 
 ;; primitives de gestion de liens generalises
 ;; temporaires ou liens de dkbms
 
EXILIEN(REP,NOMLIEN,INDC1,INDC2) 
 N EXILIEN
 N I1,I2
 S I1=$$N1(NOMLIEN,REP,INDC1),I2=$$N1(NOMLIEN,REP,INDC2)
 Q $D(@AD11@(I1,I2))
 
 
 
CRELIEN(REP,NOMLIEN,INDC1,INDC2) 
 
 N I1,I2
 S I1=$$N1(NOMLIEN,REP,INDC1),I2=$$N1(NOMLIEN,REP,INDC2)
 S @AD11@(I1,I2)=$H
 
 Q
SUPLIEN(REP,NOMLIEN,I1,I2) 
 K @AD11@(I1,I2)
 S @AD11@(I1)=@AD11@(I1)-1
 ;; attn aux mises a jour des tables locales lissucp...
 Q
SUPLT(REP,NOMLIEN) 
 
 K @(AD1),@(AD2),@(AD2REV)
 Q
COUNT(REP,NOMLIEN) 
 
 N Z,I1,I2,I,J,Z2,Z3,Z4,L
 S L=$$STO^%QSGES11(LISTIND)
 
 
 S Z="" F I=1:1 S Z=$O(@L@(Z)) Q:Z=""  S I1=$$N1(NOMLIEN,REP,Z),@LISSUCP@(I1)=0,@LISSUPP@(I1)=0
 S Z="" F I=1:1 S Z=$O(@AD11@(Z)) Q:Z=""  S I1=Z,Z2="" F J=1:1 S Z2=$O(@AD11@(Z,Z2)) Q:Z2=""  S I2=Z2 D CT
 Q
CT 
 
 
 S @LISSUC@(I1,I2)=""
 
 S @LISSUCP@(I1)=@LISSUCP@(I1)+1
 S @LISSUPP@(I2)=@LISSUPP@(I2)+1
 
 
 
 Q
INIT(REP,NOMLIEN) 
 
 
 
 Q
ADR(REP,NOMLIEN) 
 S AD="^[QUI]RQSGLO(""LIEN.TEMPORAIRE"")"
 S AD1=$$CONCAS^%QZCHAD(AD,NOMLIEN)
 S AD11=$$CONCAS^%QZCHAD(AD1,"REL")
 S AD2=$$CONCAS^%QZCHAD(AD1,"NUM")
 S ADCOUNT=$$CONCAS^%QZCHAD(AD1,"POP")
 S AD2REV=$$CONCAS^%QZCHAD(AD2,"REV")
 S LISSUC=$$CONCAS^%QZCHAD(AD1,"S")
 S LISSUCP=$$CONCAS^%QZCHAD(AD1,"NSUC")
 S LISSUPP=$$CONCAS^%QZCHAD(AD1,"NPREC")
 
 Q
N1(NOMLIEN,REP,INDCOUR) ;; 
 
 N N1
 I $D(@AD2@(REP,INDCOUR)) Q @AD2@(REP,INDCOUR)
 
 S N1=$S('($D(@ADCOUNT@(REP))):1,1:@ADCOUNT@(REP))
 S N1=N1+1,@ADCOUNT@(REP)=N1
 S @AD2@(REP,INDCOUR)=N1
 S @AD2REV@(REP,N1)=INDCOUR
 Q N1
 
N2(NOMLIEN,REP,I) ;; nom du nombre
 I $D(@AD2REV@(REP,I)) Q @AD2REV@(REP,I)
 Q ""
 
TRANS(REP,NOMLIEN) 
 
 N %ZI,%ZK,TD,CREATION,ADMAX,I,J,K,ZI,ZJ,ZK,TOTLOOP
 S TD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TD")
 S ADMAX=@ADCOUNT@(REP),TOTLOOP=0
 S CREATION=0
LOOP 
 S CREATION=0
 F I=2:1:ADMAX D LOSUC
 S TOTLOOP=TOTLOOP+1
 G FIN:(TOTLOOP>ADMAX)*ADMAX
 I CREATION=1 D COUNT(REP,NOMLIEN) G LOOP
FIN K @(TD) Q
LOSUC 
 
 S ZI="" F %ZI=1:1 S ZI=$O(@LISSUC@(I,ZI)) Q:ZI=""  D LOTER
 Q
LOTER 
 
 S ZK="" F %ZK=1:1 S ZK=$O(@LISSUC@(ZI,ZK)) Q:ZK=""  Q:$$EXILIEN^%QEPRIM(REP,NOMLIEN,$$N2^%QEPRIM(NOMLIEN,REP,I),$$N2^%QEPRIM(NOMLIEN,REP,ZK))  Q:$D(@TD@(I,ZI,ZK))  D CRELIEN(REP,NOMLIEN,$$N2^%QEPRIM(NOMLIEN,REP,I),$$N2^%QEPRIM(NOMLIEN,REP,ZK)) S @TD@(I,ZI,ZK)="done",CREATION=1
 Q
 
 
 
TEST ;;
 N GAMME,T
 S GAMME="TEST,G1,"
 S T(1)=GAMME_"PRENDRE/10.001"
 S T(2)=GAMME_"POSER/20.001"
 S T(3)=GAMME_"PRENDRE/30.001"
 S T(4)=GAMME_"POSER/40.001"
 S T(5)=GAMME_"POSER/50.001"
 S T(6)=GAMME_"MEP/60.001"
 S T(7)=GAMME_"EVACUER/70.001"
 
 S NOMLIEN="PRECEDE",REP="MOZOP"
 S LISTIND="RQS91040943",L=$$STO^%QSGES11(LISTIND)
 D ADR(REP,NOMLIEN)
 D SUPLT(REP,NOMLIEN)
 
 D CRELIEN(REP,NOMLIEN,T(7),T(1))
 D CRELIEN(REP,NOMLIEN,T(2),T(3))
 D CRELIEN(REP,NOMLIEN,T(3),T(5))
 D CRELIEN(REP,NOMLIEN,T(5),T(7))
 
 
 
 D COUNT(REP,NOMLIEN)
 D TRANS(REP,NOMLIEN)
 ;
 ;

