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

;%TLBAINT^INT^1^59547,74028^0
%TLBAINT ;
 
CREPLA(PLAN) 
 N IG,IP,TETE,ACTI,COND,I,TYPE,TEXTE,GLOSTO
 S GLOSTO="^[QUI]TTL(TRT,2)"
 S IG=1
 I ETIQ="" G CHREG
 S IG=0
SGO0 S IG=IG+1
 G:IG>$ZP(@GLOSTO@("")) CHREG
 S TETE=$S($D(@GLOSTO@(IG,"TETE")):@GLOSTO@(IG,"TETE"),1:"")
 I TETE="" S I=IG G FINERR
 S ACTI=$$RED(TETE,2)
 I $$RED(ACTI,"TYPE")'="ACTION" G SGO0
 I $$RED(ACTI,"TEXTE")'="$ETIQUETTE" G SGO0
 I $$RED($$RED(ACTI,1),"TEXTE")'=ETIQ G SGO0
 I PARTIE="" G CHREG
 S I=IG
SGO2 S IG=IG+1
 I IG'>$ZP(@GLOSTO@("")) G SCHP
 I PARTIE="CORPS" S IG=I
 G CHREG
SCHP S TETE=$S($D(@GLOSTO@(IG,"TETE")):@GLOSTO@(IG,"TETE"),1:"")
 I TETE="" S I=IG G FINERR
 S ACTI=$$RED(TETE,2)
 I $$RED(ACTI,"TYPE")'="ACTION" G SGO2
 I $$RED(ACTI,"TEXTE")="$ETIQUETTE" S IG=$ZP(@GLOSTO@("")) G SGO2
 I $$RED(ACTI,"TEXTE")'=("$"_PARTIE) G SGO2
CHREG 
 S IP=1
BCLTR 
 I IG>$ZP(@GLOSTO@("")) G FINCRE
 S TETE=$S($D(@GLOSTO@(IG,"TETE")):@GLOSTO@(IG,"TETE"),1:"")
 I TETE="" S I=IG G FINERR
 S COND=$$RED(TETE,1)
 S ACTI=$$RED(TETE,2)
 S TYPE=$$RED(ACTI,"TYPE")
 I TYPE="COMMENT" G SUIVAN
 S TEXTE=""
 I TYPE="ACTION" S TEXTE=$$RED(ACTI,"TEXTE")
 I (ETIQ="")&((((TEXTE="$ETIQUETTE")!(TEXTE="$PROLOGUE"))!(TEXTE="$CORPS"))!(TEXTE="$EPILOGUE")) G SAUSS
 
 I (TEXTE="$FIN")&(COND=0) S IG=$ZP(@GLOSTO@("")) G SUIVAN
 S @PLAN@(IP)=IG,IP=IP+1
 G SUIVAN
SAUSS 
 S I=IG,TEXTE=""
BSAUSS 
 I I'<$ZP(@GLOSTO@("")) G FSAUSS
 I TEXTE="$FIN" G FSAUSS
 S I=I+1
 S TETE=$S($D(@GLOSTO@(I,"TETE")):@GLOSTO@(I,"TETE"),1:"")
 I TETE="" G FINERR
 S COND=$$RED(TETE,1)
 I COND=0 S ACTI=$$RED(TETE,2) I $$RED(ACTI,"TYPE")="ACTION" S TEXTE=$$RED(ACTI,"TEXTE")
 G BSAUSS
FSAUSS 
 S IG=I
SUIVAN 
 S IG=IG+1
 G BCLTR
FINCRE 
 Q
FINERR 
 D ^%VZEAVT($$^%QZCHW("La ligne ")_I_$$^%QZCHW(" du traitement ")_TRT_$$^%QZCHW(" est mal analysee"))
 K @(PLAN)
 Q
 
CMPDAT(DATE1,DATE2) 
 
 N DIFJ,DIFH
 
 S DIFJ=$P(DATE1,",",1)-$P(DATE2,",",1)
 I DIFJ>0 Q 1
 I DIFJ<0 Q 0
 
 S DIFH=$P(DATE1,",",2)-$P(DATE2,",",2)
 I DIFH>0 Q 1
 I DIFH<0 Q 0
 Q 2
 
ARBAPP 
 N CLE1,CLE2,PAS,CLEREF,ORD,I,LON
 I (NIVEAU<1)!((MODAF'=2)&(MODAF'=3)) Q
 I NIVEAU=1 S @GLOETD@("PAS.TRAITEMENT")=1,(@GLOETD@("PAS.ARBRE"),@GLOETD@("PAS"))=0 Q
 S PAS=$P(@GLOETD@("PAS.TRAITEMENT"),".",1,NIVEAU)
 S CLE1=@GLOETD@(NIVEAU-1,"TRAITEMENT")
 S CLE1=CLE1_$S(@GLOETD@(NIVEAU-1,"SOUS.TRAITEMENT")'="":","_@GLOETD@(NIVEAU-1,"SOUS.TRAITEMENT"),1:"")
 S CLE1=CLE1_$S(@GLOETD@(NIVEAU-1,"PARTIE")'="":","_@GLOETD@(NIVEAU-1,"PARTIE"),1:"")
 S ORD=$P(PAS,".",NIVEAU-1),LON=$L(ORD) F I=LON:1:2 S ORD="0"_ORD
 S CLE1=ORD_"- "_CLE1
 S CLEREF=TRT_$S(ETIQ'="":","_ETIQ,1:"")_$S(PARTIE'="":","_PARTIE,1:"")
 S CLE2=""
BCLCLE 
 S CLE2=$O(@GLOETD@("ARBRE.APPEL",CLE1,CLE2))
 I CLE2="" G NONTR
 I CLE2[CLEREF G TROUVE
 G BCLCLE
NONTR 
 S ORD=$P(PAS,".",NIVEAU)+1
 S ORD=$E(ORD,1,3),LON=$L(ORD) F I=LON:1:2 S ORD="0"_ORD
 S CLE2=ORD_"- "_CLEREF
TROUVE 
 S @GLOETD@("ARBRE.APPEL",CLE1,CLE2)=$S($D(@GLOETD@("ARBRE.APPEL",CLE1,CLE2)):@GLOETD@("ARBRE.APPEL",CLE1,CLE2),1:0)+1
 S ORD=$E(CLE2,1,3)+0,$P(PAS,".",NIVEAU)=ORD
 S @GLOETD@("PAS.TRAITEMENT")=PAS
 Q
 
INITRT 
 N I,GLOSTO
 S GLOSTO="^[QUI]TTL(TRT,2)"
 K @GLOETD@(NIVEAU,"PLAN")
 S I=""
BCLTRT S I=$O(@PLAN@(I))
 I I="" Q
 S @GLOETD@(NIVEAU,"PLAN",I)=$J(I,3)_" "_@GLOSTO@(@PLAN@(I))
 G BCLTRT
 
INIREM(PLAN,PLANE) 
 N AFF,GLOSTO,I,J,N
 S GLOSTO="^[QUI]TTL(TRT,2)"
 S AFF=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PLAN") K @(AFF)
 S I="",N=1
BCLRI S I=$ZP(@PLAN@(I)) I I="" Q
 S J=""
BCLRJ S J=$O(@PLAN@(I,J)) I J="" G BCLRI
 S @AFF@(N)=$J(N,3)_" "_@GLOSTO@(J)
 S @PLANE@(J)=N,N=N+1
 G BCLRJ
 
INIARB(PLAN,PLANE) 
 N I,J,GLOSTO,AFF,PILE,N,PROF
 S GLOSTO="^[QUI]TTL(TRT,2)"
 S AFF=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PLAN") K @(AFF)
 S PILE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(PILE)
 S I=0,PROF=0,N=1
BCLREA 
 S J=""
BCLNRA 
 S J=$O(@PLAN@(I,J))
 I J'="" G ESAFF
 I PROF=0 G CHREGR
 S I=@PILE@(PROF,"I"),J=@PILE@(PROF,"J"),PROF=PROF-1
 G BCLNRA
ESAFF 
 I @PLANE@(J)'=0 D AFFLIG(1) G BCLNRA
 D AFFLIG(0)
 S PROF=PROF+1,@PILE@(PROF,"I")=I,@PILE@(PROF,"J")=J,I=J
 G BCLREA
CHREGR 
 S J=""
BCREGR 
 S J=$O(@PLANE@(J)) I J="" K @(PILE) Q
 I @PLANE@(J)'=0 G BCREGR
 D AFFLIG(0)
 G BCREGR
AFFLIG(DEJAVU) 
 N K
 S @AFF@(N)="" F K=1:1:PROF S @AFF@(N)=@AFF@(N)_"  "
 I DEJAVU S @AFF@(N)=@AFF@(N)_"(*) "
 S @AFF@(N)=@AFF@(N)_@GLOSTO@(J)
 I '(DEJAVU) S @PLANE@(J)=N
 S N=N+1
 Q
 
INIABR(PLAN,PLANE) 
 N I,J,K,GLOSTO,AFF,PILE,N,PROF
 S GLOSTO="^[QUI]TTL(TRT,2)"
 S AFF=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PLAN") K @(AFF)
 S PILE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(PILE)
 S I=0,PROF=0,N=1
BCLBMI 
 S K=""
BCLBMK 
 S K=$ZP(@PLAN@(I,K))
 I K'="" G BCREAR
 I PROF=0 G AFREGE
 S I=@PILE@(PROF,"I"),K=@PILE@(PROF,"K"),J=@PILE@(PROF,"J"),PROF=PROF-1
 G BCNRAR
BCREAR 
 S J=""
BCNRAR 
 S J=$O(@PLAN@(I,K,J))
 I J="" G BCLBMK
 
 I @PLANE@(J)'=0 D AFFLIG(1) G BCNRAR
 D AFFLIG(0)
 S PROF=PROF+1,@PILE@(PROF,"I")=I,@PILE@(PROF,"K")=K
 S @PILE@(PROF,"J")=J,I=J
 G BCLBMI
AFREGE 
 S J=""
BCAFRE 
 S J=$O(@PLANE@(J)) I J="" K @(PILE) Q
 I @PLANE@(J)'=0 G BCAFRE
 D AFFLIG(0)
 G BCAFRE
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 ;

