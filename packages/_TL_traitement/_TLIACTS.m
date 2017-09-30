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

;%TLIACTS^INT^1^59547,74029^0
%TLIACTS ;
 
 
 
 
ADDIT 
 N ATT,EXPRE
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Addition forcee"))
 S POSS=1,ATT=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POSS)
 I (POSS=0)!(ATT="") S ATT=0 D:MODAF ADD^%TLIFEN("ATT",$$^%QZCHW("    = 0"))
 S POSS=1,EXPRE=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POSS)
 I (POSS=0)!(EXPRE="") S EXPRE=0 D:MODAF ADD^%TLIFEN("ATT",$$^%QZCHW("    = 0"))
 S EXPRE=ATT+EXPRE
 D AFF($$RED(ACTI,1),EXPRE)
 Q
 
 
AFF(NOEUD,VAL) 
 N ATTRI,IN,VAR,REP2
 G:NOEUD=0 AFFER
 I VAL="" D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Interdit affecter chaine vide")) G AFFER
 G:$$RED(NOEUD,"TYPE")="VALEUR.SPECIALE" MOTRES
 G:'($$ATTR^%TLIACT4(NOEUD,.ATTRI,.IN,.VAR,.REP2)) AFFER
 G AFFAT2
 
AFFAT(REP2,VAR,ATTRI,VAL,IN) 
 I VAL="" D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Interdit affecter chaine vide")) G AFFER
 S:IN="" IN=1
 
AFFAT2 N LIB,Y1BIS
 G:ATTRI="" AFFER
 I $E(ATTRI)="%" S LIB=ATTRI G AFFF
 S LIB=$S(IN=1:ATTRI,1:ATTRI_"("_IN_")")
 I ATTRI=$$^%QZCHW("NOM") D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Interdit affecter attribut NOM")) G AFFER
AFF0 I $$TYPE^%QSGEST9(REP2,ATTRI)'=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Interdit affecter attribut lien")) G AFFER
AFF1 
 I '($D(^[QUI]RQSDON("REMATDAT",REP2,ATTRI))) D SETREM^%QMDAUC(REP2,ATTRI)
 S Y1BIS=$S(^[QUI]RQSDON("REMATDAT",REP2,ATTRI):$$INTF^%QMDAUC(REP2,ATTRI,VAL),1:VAL)
 
 I Y1BIS="" D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Impossible affecter attribut de type DATE")) G AFFER
 I '($$AIR^%QSGE5(REP2,VAR,"NOM")) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Individu inexistant : creation")) D CREERIND^%TLIACTE(REP2,VAR,"") G:ECHEC=1 AFFER
 
 D:'($D(^[QUI]RQSDON("REMPRVAL",REP2,ATTRI))) SETREM^%QSPRVAL(REP2,ATTRI)
 I ^[QUI]RQSDON("REMPRVAL",REP2,ATTRI),$$LEGAL^%QSPRVAL(REP2,ATTRI,Y1BIS)=2 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("valeur refusee")) G AFFER
 
 
 D:MODEX=2 STATT^%TLBAATT(REP2,VAR,ATTRI,Y1BIS,IN,"AJOUT")
 D:MODEX'=1 PA^%QSGESTI(REP2,VAR,ATTRI,Y1BIS,IN)
 G AFFS
AFFF 
 D:MODEX=2 STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),ATTRI,VAL,IN,"AJOUT")
 I (MODEX'=1)!((MODAF'=2)&(MODAF'=3)) D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ATTRI,VAL,IN)
 
AFFS D:MODAF ADD^%TLIFEN("ATT",LIB_"<---"_VAL)
 Q
 
AFFER S ECHEC=1
 Q
 
MOTRES 
 S IN=$$RED(NOEUD,1),ATTRI=$$RED(IN,"TEXTE")
 I (ATTRI'=$$^%QZCHW("$NOUVELLE.VALEUR"))&(ATTRI'=$$^%QZCHW("$MAJ.BASE")) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("seule la nouvelle valeur ($NOUVELLE.VALEUR) peut etre modifiee")) G AFFER
 S ^PILMOTRE($J,^PILMOTRE($J),ATTRI)=VAL
 Q
 
SAISIR 
 N SAI,TYP,GLOSA,VAL,VALBID,ETYP
 N I,NBC,VALEUR,ABAND,NVAL
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Saisie de valeurs"))
 S VAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VAL")
 S VALBID=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"BIDON")
 K @(VAL),@(VALBID)
 S POSS=1,TYP=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POSS)
 I (POSS=0)!(TYP="") D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Impossible evaluer type")) G ERRSAI
 F ETYP=1,2,3,100,101,110,111,200,201,210,211,300 G:TYP=ETYP OKTYP
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Numero de type non valide")) G ERRSAI
OKTYP S ETYP=$E(TYP)
 S POSS=1,SAI=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POSS)
 I (POSS=0)!(SAI="") D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Impossible evaluer nom Saisie")) G ERRSAI
 S GLOSA=$$ADR^%SRCOMP(SAI)
 I '($D(@GLOSA)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Saisie inexistante ou non validee")) G ERRSAI
 
 G:ETYP'=3 SAIS1
 D ACT^%SRACTIV(SAI,0,GLOSA)
 D CLEPAG^%VVIDEO,REAFF^%TLUTIL
 Q
SAIS1 
 S NBC=@GLOSA@("NBC")
 I $$RED(ACTI,NBC+2)=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Nb d'attributs recepteurs insuffisant")) G ERRSAI
 S @VAL=$P(VALBID,")")
 X @GLOSA@("DEFAUT")
 G:ETYP=1 SAIS2
 S I=1
BSAI S NVAL=$$RED(ACTI,I+2)
 S VALEUR=$$SUBST^%ANARBR2(NVAL,.CXT,"ATT^%TLIACT3",.POSS)
 I (VALEUR'="")&POSS S @VAL@(I)=VALEUR
 S POSS=1,I=I+1
 G:I>NBC SAIS2
 G BSAI
 
SAIS2 
 S I=1
BSAI2 S:'($D(@VAL@(I))) @VAL@(I)="" S I=I+1 G:I>NBC SAISIA G BSAI2
 
SAISIA I MODAF!('($E(TYP,2))) D CLEPAG^%VVIDEO
 
 D EXT^%PKSAISI(1,GLOSA,VAL,.POSS,.ABAND)
 I MODAF!('($E(TYP,3))) D CLEPAG^%VVIDEO
 D REAFF^%TLUTIL
 
 I POSS'=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Pbme lors de la saisie")) G ERRSAI
 I ABAND'=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Abandon lors de la saisie")) G BSAIF
 S I=1,TYP=@VALBID
BSAIA G:I>NBC BSAIF
 D AFF($$RED(ACTI,I+2),$P(TYP,$C(0),I))
 S I=I+1
 G BSAIA
 
BSAIF K @(VAL),@(VALBID)
 Q
 
ERRSAI K @(VAL),@(VALBID)
 S ECHEC=1
 Q
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 ;

