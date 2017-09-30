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

;%TLIACTG^INT^1^59547,74029^0
%TLIACTG ;
 
 
LIER 
 N REP1,NOM1,REP2,NOM2,REPI1,REPI2,LIEN,POS
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Creation lien relationnel entre 2 individus"))
 S REP1=$$RED(ACTI,1)
 I REP1=0 S REPI1=CXT("@","BASE"),NOM1=CXT("@","OBJET"),REP1=$$NOMLOG^%QSF(REPI1) G INDIV2
 S POS=1,REP1=$$SUBST^%ANARBR2(REP1,.CXT,"ATT^%TLIACT3",.POS)
 I (REP1="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom 1er repertoire")) S ECHEC=1 Q
 S REPI1=$$NOMINT^%QSF(REP1)
 I REPI1="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  1er repertoire inconnu")) S ECHEC=1 Q
 I REPI1=$$LIENI^%QSGEL3 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit lier un individu LIEN")) S ECHEC=1 Q
 S NOM1=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I (NOM1="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom 1er individu")) S ECHEC=1 Q
 I '($$IR^%QSGEST5(REPI1,NOM1)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  1er individu inconnu dans le repertoire")) S ECHEC=1 Q
INDIV2 S LIEN=$$SUBST^%ANARBR2($$RED(ACTI,3),.CXT,"ATT^%TLIACT3",.POS)
 I (LIEN="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom 2nd repertoire")) S ECHEC=1 Q
 I '($D(^[QUI]RQSLIEN(REPI1,LIEN))) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Il n'existe aucun lien "_LIEN_" partant du repertoire ")_REP1) S ECHEC=1 Q
 S LIENB=^[QUI]RQSLIEN(REPI1,LIEN)
 S REPI2=$P(LIENB,"^",2)
 I REPI2="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  2nd repertoire inconnu")) S ECHEC=1 Q
 I REPI2=$$LIENI^%QSGEL3 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit lier individu LIEN")) S ECHEC=1 Q
 S LIENB=$P(LIENB,"^")
 I ((LIENB'=3)&(LIENB'=4))&(LIENB'=5) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Lien ni relationnel, ni involutif")) S ECHEC=1 Q
 S NOM2=$$SUBST^%ANARBR2($$RED(ACTI,4),.CXT,"ATT^%TLIACT3",.POS)
 I (NOM2="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom 2nd individu")) S ECHEC=1 Q
 I '($$IR^%QSGEST5(REPI2,NOM2)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  2nd individu inconnu dans le repertoire")) S ECHEC=1 Q
 I $$VAIR^%QSGEST5(REPI1,NOM1,LIEN,NOM2) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Lien deja existant")) S ECHEC=1 Q
 D:MODEX=2 STLIEN^%TLBAATT(REPI1,NOM1,LIEN,REPI2,NOM2,"AJOUT")
 D:MODEX'=1 ADDS^%QSGEST3(REPI1,NOM1,LIEN,REPI2,NOM2)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin creation du lien relationnel"))
 Q
 
 
LATTR N ATRES,IN,REPR,NO,INDR,ATTR,REP,INDIV,NOR,TEMP,ORD,VALU
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Recherche sur attributs d'un individu"))
 I '($$ATTR^%TLIACT4($$RED(ACTI,1),.ATRES,.NOR,.INDR,.REPR)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible determiner attribut resultat")) S ECHEC=1 Q
 I ATRES="NOM" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit modifier attribut NOM")) S ECHEC=1 Q
 I $$TYPE^%QSGEST9(REPR,ATRES)'=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit modifier un attribut lien")) S ECHEC=1 Q
 S INDIV=$$OBPROX2^%QSCALVU($$RED($$RED(ACTI,2),"TEXTE"),CXT("@","BASE"),CXT("@","OBJET"),.REP)
 I INDIV="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible determiner individu de recherche")) S ECHEC=1 Q
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S @TEMP@("%ATTRIBUTS")=0,@TEMP@("%VALEURS")=0
 S ATTR=""
BOUCAT S ATTR=$$NXTRIA^%QSTRUC8(REP,INDIV,ATTR)
 G:ATTR="" FINBOUC
 S @TEMP@("%ATTRIBUTS")=@TEMP@("%ATTRIBUTS")+1
 S @TEMP@(ATTR)=0
 S ORD=""
BOUCORD S ORD=$$NXTRIAO^%QSTRUC8(REP,INDIV,ATTR,ORD)
 G:ORD="" BOUCAT
 S VALU=$$VALEUR^%QSTRUC8(REP,INDIV,ATTR,ORD)
 S @TEMP@("%VALEURS")=@TEMP@("%VALEURS")+1
 S @TEMP@(ATTR)=@TEMP@(ATTR)+1
 G BOUCORD
FINBOUC S IN=""
BOUCREMP S IN=$O(@TEMP@(IN))
 G:IN="" FINATTR
 D PA^%QSGESTI(REPR,INDR,ATRES,@TEMP@(IN),IN)
 G BOUCREMP
FINATTR K @(TEMP)
 Q
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

